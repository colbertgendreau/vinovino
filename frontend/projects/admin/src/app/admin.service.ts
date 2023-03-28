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
  private urlExecutePourcentage:string = environment.apiUrl+"/api/progres";
  private urlExecutePourcentage8001:string = "http://127.0.0.1:8001/api/progres";

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

    executeSaq(timeString):Observable<IDate>{
      this.loading$.next(true);
      const data = { time: timeString };
      const execute$ = this.http.post<any>(this.urlExecute, data);
      const progres$ = interval(2000).pipe(switchMap(() => {
        return this.http.get<IDate>(this.urlExecutePourcentage8001).pipe(
          tap(data => {
            //C'est ici qu'on veut mettre la valeur de la barre de progression
            let nb_pages_completees_egalise_sur_100 = (data.nb_pages_completees*100)/data.nb_pages_totales
            // Il faut égaliser sur 100 la valeur de data.resultat
            //Ex: 50 * 100 / 84 = 50= 59%
            this.progressValue$.next(nb_pages_completees_egalise_sur_100);
          })
        );
      })
    );
    forkJoin([execute$, progres$]).subscribe(([execute, progres]) => {
      this.loading$.next(false);
      }, (error) => {
      console.error(error);
      this.progressValue$.next(-1);
      this.loading$.next(false);
    });
    return progres$;
  }

  executeSaq2(timeString): Observable<IDate> {
    this.snack$.next(false);
    const data = { time: timeString };
    const execute$ = this.http.post<any>(this.urlExecute, data).pipe(
      timeout(2400000)
    );

    const stop$ = new Subject();

    const progress$ = interval(4000).pipe(
      switchMap(() => this.http.get<IDate>(this.urlExecutePourcentage)),
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
          console.log("executeAndProgress$");
          console.log(execute);
        },
        error: (error) => {
          console.error(error);
          //this.progressValue$.next(-1);
          //this.loading$.next(false);
        },
        complete: () => {
          this.loading$.next(false);
          console.log("loading complete");
          this.buttonClicked$.next(false);
          console.log("button clicked complete");
          this.hidden$.next(true);
          console.log("hidden complete");
          this.snack$.next(true);
          console.log("snack complete");
        }
      }
    );

    return progress$;
  }

  // ajoutBouteille(bouteille:Imesbouteilles):Observable<Imesbouteilles>{
  //   return this.http.post<Imesbouteilles>(this.urlExecute, bouteille);
  // }
}

