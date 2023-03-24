import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from "../environments/environment";
import { IUser } from './iuser';
import { IlisteUser } from './iliste-user';
import {ICatalogue} from "./icatalogue";
import {Imesbouteilles} from "../../../../src/app/imesbouteilles";
import {IDate} from "./idate";
import {Observable, forkJoin, interval, Subject, tap} from 'rxjs';
import { switchMap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})

export class AdminService {
  // Important: Ne pas utilsier http://127.0.0.1:8000, à la place utiliser ex:
  // private urlBouteille:string = environment.apiUrl+"/api/bouteilles";

  private urlUtilisateur:string = environment.apiUrl+"/api/utilisateurs";
  private urlExecute:string = environment.apiUrl+"/api/execute";
  private urlExecutePourcentage:string = environment.apiUrl+"/api/progres";

  loading$= new Subject<boolean>();
  progressValue$ = new Subject<number>();

  constructor(private http:HttpClient) { }

  getUtilisateur():Observable<IlisteUser> {
    return this.http.get<IlisteUser>(this.urlUtilisateur);
  }

  effacerUtilisateur(id:number):Observable<IUser> {
    return this.http.delete<IUser>(this.urlUtilisateur+"/"+id);
  }

  getDonnesSaq():Observable<ICatalogue> {
    return this.http.get<any>(this.urlExecute);
  }

    executeSaq(heure) {
      this.loading$.next(true);
      console.log(heure)
      //const execute$ = this.http.post<IDate>(this.urlExecute, heure);

    this.http.post<IDate>(this.urlExecute, heure);
    // const progres$ = interval(2000).pipe(
    //   switchMap(() => {
    //     return this.http.get<IDate>(this.urlExecutePourcentage).pipe(
    //       tap(data => {
    //         console.log("progressValue$ 2")
    //         console.log(this.progressValue$.next(data.resultat))
    //         this.progressValue$.next(data.resultat);
    //         console.log(this.progressValue$+ " progressValue$ 3")
    //       })
    //     );
    //   })
    // );
    // forkJoin([execute$, progres$]).subscribe(([execute, progres]) => {
    //     console.log(execute);
    //   return execute;
    //   console.log(progres);
    //   }, (error) => {
    //   console.error(error);
    //   this.progressValue$.next(-1);
    //   this.loading$.next(false);
    // });
  }



  // ajoutBouteille(bouteille:Imesbouteilles):Observable<Imesbouteilles>{
  //   return this.http.post<Imesbouteilles>(this.urlExecute, bouteille);
  // }
}

