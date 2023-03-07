import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IBouteille } from './ibouteille';
import { IlisteBouteille } from './iliste-bouteille';

@Injectable({
  providedIn: 'root'
})
export class FetchService {

  constructor(private http:HttpClient) { }

  getBd():Observable<IlisteBouteille>{
    return this.http.get<IlisteBouteille>("http://localhost:8000/api/bouteilles");
    

    
    
  }
}
