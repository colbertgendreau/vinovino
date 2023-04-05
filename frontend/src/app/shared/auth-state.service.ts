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
  }

  /**
   * Met à jour l'état de l'authentification de l'utilisateur
   * @param {boolean} value - la valeur à définir pour l'état de l'authentification
   */
  setAuthState(value: boolean) {
    this.userState.next(value);
  }

  /**
   * Retourne un observable permettant de s'abonner au statut de la connexion utilisateur
   * @returns {Observable<boolean>} un observable qui émettra une valeur booléenne indiquant si l'utilisateur est connecté ou non
   */
  statutConnexion():Observable<boolean> {
    return this.userState;
  }
}