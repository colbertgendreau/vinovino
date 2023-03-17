import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from "../environments/environment";
import { IUser } from './iuser';
import { IlisteUser } from './iliste-user';



@Injectable({
  providedIn: 'root'
})

export class AdminService {
  // Important: Ne pas utilsier http://127.0.0.1:800, à la place utiliser ex:
  // private urlBouteille:string = environment.apiUrl+"/api/bouteilles";

  private urlUtilisateur:string = environment.apiUrl+"/api/utilisateurs";

  constructor(private http:HttpClient) { }

  getUtilisateur():Observable<IlisteUser> {
    return this.http.get<IlisteUser>(this.urlUtilisateur);
  }

  ajouterUtilisateur(data:IUser):Observable<IUser> {
    return this.http.post<IUser>(this.urlUtilisateur, data);
  }

  effacerUtilisateur(id:number):Observable<IUser> {
    console.log(this.urlUtilisateur+"/"+id);
    return this.http.delete<IUser>(this.urlUtilisateur+"/"+id);
  }


}
