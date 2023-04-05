import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class TokenService {
  private issuer = {
    login: environment.apiUrl + '/api/auth/login',
    register: environment.apiUrl + '/api/auth/register',
  };
  constructor() { }

  /**
   * Stocke le token d'authentification dans le local storage après sa réception depuis le serveur.
   * @param {any} token - le token d'authentification reçu depuis le serveur
   */
  handleData(token: any) {
    localStorage.setItem('auth_token', token);
  }

  /**
 * Cette fonction permet de récupérer le token d'authentification de l'utilisateur stocké en local storage.
 *
 * @returns {string} Le token d'authentification de l'utilisateur
 */
  getToken() {
    return localStorage.getItem('auth_token');
  }


  /**
 * Vérifie si le token d'authentification stocké dans le localStorage est valide
 * @returns {boolean} true si le token est valide et émis par une source de confiance, false sinon
 */
  isValidToken() {
    const token = this.getToken();
    if (token) {
      const payload = this.payload(token);
      if (payload) {
        return Object.values(this.issuer).indexOf(payload.iss) > -1
          ? true
          : false;
      }
    } else {
      return false;
    }
  }

  /**
   * Décode la charge utile (payload) d'un token JWT et renvoie un objet JSON contenant les informations qu'il contient
   * @param {string} token - le token JWT dont on veut déchiffrer la charge utile
   * @returns {object} un objet JSON contenant les informations de la charge utile du token
   */
  payload(token: any) {
    const jwtPayload = token.split('.')[1];
    return JSON.parse(atob(jwtPayload));
  }
  
  /**
   * Vérifie si l'utilisateur est actuellement connecté en vérifiant si le token d'authentification est valide
   * @returns {boolean} true si l'utilisateur est connecté, false sinon 
   */
  isLoggedIn() {
    return this.isValidToken();
  }

  /**
   * Supprime le token d'authentification stocké dans le localStorage
   */
  removeToken() {
    localStorage.removeItem('auth_token');
  }
}
