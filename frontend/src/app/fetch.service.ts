import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IBouteille } from './ibouteille';
import { IlisteBouteille } from './iliste-bouteille';
import { ICellier } from './icellier';
import { IlisteCellier } from './iliste-cellier';

@Injectable({
  providedIn: 'root'
})
export class FetchService {

  private url:string = "http://127.0.0.1:8000/api/bouteilles";
  private urlCellier:string ="http://127.0.0.1:8000/api/celliers";
  constructor(private http:HttpClient) { }

  getBouteilleSAQ():Observable<IlisteBouteille>{
    return this.http.get<IlisteBouteille>(this.url); 
  }
  // getBouteilleSAQ():Observable<IlisteBouteille>{
  //   return this.http.get<IlisteBouteille>("http://localhost:8000/api/bouteilles"); 
  // }

  // getCellier():Observable<IlisteBouteille>{
  //   return this.http.get<IlisteBouteille>("http://localhost:8000/api/bouteilles"); 
  // }

  getUneBiere(id:number):Observable<IBouteille>{
    return this.http.get<IBouteille>(this.url+"/"+id);


  }

  getCelliers():Observable<IlisteCellier>{
    return this.http.get<IlisteCellier>(this.urlCellier);
  }
}


