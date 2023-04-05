import {Injectable, isDevMode} from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';


// User interface
export class User {
  name!: String;
  email!: String;
  password!: String;
  password_confirmation!: String;
  type!: String;
}
@Injectable({
  providedIn: 'root',
})
export class AuthService {
  constructor(private http: HttpClient) {}

/**
 * Enregistre un nouvel utilisateur en appelant l'API d'inscription
 * @param {User} user - les informations utilisateur à enregistrer
 * @returns {Observable<any>} un Observable contenant la réponse de l'API d'inscription
 */
  register(user: User): Observable<any> {
    if (isDevMode()) {
      return this.http.post<any>(environment.apiUrl+'/api/auth/register', user);
    } else {
      return this.http.post<any>(environment.apiUrl+'/api/auth/register', user);
    }
  }

  /**
   * Envoie une requête de connexion au serveur en utilisant les informations d'utilisateur fournies
   * @param {User} user - les informations d'utilisateur pour se connecter (email et mot de passe)
   * @returns {Observable<any>} un observable contenant la réponse du serveur (jeton d'authentification et autres informations)
   */
  signin(user: User): Observable<any> {
    if (isDevMode()) {
      return this.http.post<any>(environment.apiUrl+'/api/auth/login', user);
    } else {
      return this.http.post<any>(environment.apiUrl+'/api/auth/login', user);
    }
  }

  /**
   * Récupère le profil de l'utilisateur courant
   * @returns {Observable<any>} Observable contenant le profil de l'utilisateur courant
   */
  profileUser(): Observable<any> {
    return this.http.get(environment.apiUrl+'/api/auth/user-profile');
  }


}

