import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/internal/BehaviorSubject';
import { TokenService } from './token.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})

export class AuthStateService {

  private userState = new BehaviorSubject<boolean>(this.token.isLoggedIn()!);  

  userAuthState = this.userState.asObservable();

  constructor(public token: TokenService) {
    console.log(token);
  }

  setAuthState(value: boolean) {
    console.log(value);
    this.userState.next(value);
  }

  statutConnexion():Observable<boolean> {
    return this.userState;
  }
}