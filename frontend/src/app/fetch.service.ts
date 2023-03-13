import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IBouteille } from './ibouteille';
import { IlisteBouteille } from './iliste-bouteille';
import {environment} from "../environments/environment";
import { ICellier } from './icellier';
import { IlisteCellier } from './iliste-cellier';
import { Ilistemesbouteilles } from './ilistemesbouteilles';
import { Imesbouteilles } from './imesbouteilles';

@Injectable({
  providedIn: 'root'
})
export class FetchService {


  private urlBouteille:string = environment.apiUrl+"/api/bouteilles";
  private url:string = environment.apiUrl+"/api/bouteillesSAQ";
  private urlCellier:string = environment.apiUrl+"/api/celliers";


  constructor(private http:HttpClient) { }

  getBouteilleSAQ():Observable<IlisteBouteille>{
    return this.http.get<IlisteBouteille>(this.url);
  }

  ajoutBouteille(bouteille: Imesbouteilles):Observable<Imesbouteilles>{
    console.log(bouteille);

    return this.http.post<Imesbouteilles>(this.urlBouteille, bouteille);
  }
  // getBouteilleSAQ():Observable<IlisteBouteille>{
  //   return this.http.get<IlisteBouteille>(environment.production+"/api/bouteilles");
  // }

  // getCellier():Observable<IlisteBouteille>{
  //   return this.http.get<IlisteBouteille>(environment.production+'"/api/bouteilles");
  // }

  // getUneBouteille(id:number):Observable<IBouteille>{
  //   return this.http.get<IBouteille>(this.url+"/"+id);         /// non fonctionnelle


  // }

  getBouteillesCellier(id:number):Observable<Ilistemesbouteilles>{
    return this.http.get<Ilistemesbouteilles>(this.urlCellier+"/"+id);
  }

  getCelliers():Observable<IlisteCellier>{
    return this.http.get<IlisteCellier>(this.urlCellier);
  }
  ajoutCellier(cellier: ICellier):Observable<ICellier>{
    console.log(this.urlCellier+ " l'url cellier");
    console.log(cellier+ " cellier");
    return this.http.post<ICellier>(this.urlCellier, cellier);
  }

  getUnCellier(id:number):Observable<ICellier>{
    console.log(id);
    return this.http.get<ICellier>(this.urlCellier+"/"+id);
  }
  modifCellier(id:number, cellier: ICellier):Observable<ICellier>{
    console.log(this.urlCellier+"/"+id +" modifier le cellier url");
    return this.http.put<ICellier>(this.urlCellier+"/"+id, cellier);
  }

  showCellier(id:number):Observable<ICellier>{
    return this.http.get<ICellier>(environment.apiUrl+"/api/show/"+id);
  }
}


