import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from "../environments/environment";
import { IUser } from './iuser';
import { IlisteUser } from './iliste-user';
import {ICatalogue} from "./icatalogue";
import {Imesbouteilles} from "../../../../src/app/imesbouteilles";
import {IDate} from "./idate";
import {Observable, forkJoin, interval, Subject, tap, timeout} from 'rxjs';
import { switchMap, takeUntil} from 'rxjs/operators';
import { MatSnackBar } from '@angular/material/snack-bar';

@Injectable({
  providedIn: 'root'
})

export class AdminService {
  // Important: Ne pas utilsier http://127.0.0.1:8000, à la place utiliser ex:
  // private urlBouteille:string = environment.apiUrl+"/api/bouteilles";

  private urlUtilisateur:string = environment.apiUrl+"/api/utilisateurs";
  private urlExecute:string = environment.apiUrl+"/api/execute";
  private urlExecuteDetails:string = environment.apiUrl+"/api/details";
  //private urlExecutePourcentage:string = environment.apiUrl+"/api/progres";
  //private urlExecutePourcentage8001:string = "http://127.0.0.1:8001/api/progres";
  private urlExecutePourcentage:string = environment.apiUrlCrawler+"/api/progres";
  private urlExecutePourcentageDetails:string = environment.apiUrlCrawler+"/api/description";

  loading$= new Subject<boolean>();
  buttonClicked$= new Subject<boolean>();
  hidden$= new Subject<boolean>();
  snack$= new Subject<boolean>();
  progressValue$ = new Subject<number>();

  constructor(private http:HttpClient,private _snackBar: MatSnackBar) { }

  getUtilisateur():Observable<IlisteUser> {
    return this.http.get<IlisteUser>(this.urlUtilisateur);
  }

  effacerUtilisateur(id:number):Observable<IUser> {
    return this.http.delete<IUser>(this.urlUtilisateur+"/"+id);
  }

  getDonnesSaq():Observable<ICatalogue> {
    return this.http.get<any>(this.urlExecute);
  }

  executeSaq(timeString, details): Observable<IDate> {
    this.snack$.next(false);
    const data = { time: timeString };
    let adresse;
    if (details==1) {
      adresse = this.urlExecuteDetails;
    }else {
      adresse = this.urlExecute;
    }

    const execute$ = this.http.post<any>(adresse, data).pipe(
      timeout(2400000)
    );
    const stop$ = new Subject();

    let adressePourcentage;
    if (details==1) {
      adressePourcentage = this.urlExecutePourcentageDetails;
    }else {
      adressePourcentage = this.urlExecutePourcentage;
    }

    const progress$ = interval(4000).pipe(

      switchMap(() => this.http.get<IDate>(adressePourcentage)),
      tap(data => {
        const nb_pages_completees_egalise_sur_100 = (data.nb_pages_completees * 100) / data.nb_pages_totales;
        this.progressValue$.next(nb_pages_completees_egalise_sur_100);
        if(data.nb_pages_completees == data.nb_pages_totales){
          this._snackBar
            .open(
              'Votre liste de bouteilles de vin est à jour! Vous avez '
              +data.nb_bouteilles +
              ' bouteilles dans votre catalogue. ',
              'Close', { duration: 6000 });

          this.loading$.next(false);
          this.buttonClicked$.next(false);
          this.hidden$.next(true);
          this.snack$.next(true);
          this.progressValue$.next(100);
          this.loading$.next(false);
          stop$.next(1);
        }
      }),
      takeUntil(stop$)
    );

    const executeAndProgress$ = forkJoin([execute$, progress$]);

    executeAndProgress$.subscribe(
      {
        next: ([execute, progress]) => {
          this.loading$.next(false);
          this.buttonClicked$.next(false);
          this.hidden$.next(true);
          this.snack$.next(true);
        },
        error: (error) => {
          console.error(error);
          //this.progressValue$.next(-1);
          //this.loading$.next(false);
        },
        complete: () => {
          // Cette section ne semble pas fonctionner a cause de lerreur 504
          this.loading$.next(false);
          this.buttonClicked$.next(false);
          this.hidden$.next(true);
          this.snack$.next(true);
        }
      }
    );

    return progress$;
  }

}

