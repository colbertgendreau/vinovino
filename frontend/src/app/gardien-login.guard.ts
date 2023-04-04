import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthStateService } from './shared/auth-state.service';

@Injectable({
  providedIn: 'root'
})

export class GardienLoginGuard implements CanActivate {

  estConnecte: boolean = false;

  /**
   * Constructeur de la classe GardienLoginGuard
   * @param authServ composant AuthStateService
   * @param router composant Router
   */
  constructor(private authServ: AuthStateService, private router: Router) {
    this.authServ.statutConnexion().subscribe((etat) => {
      this.estConnecte = etat;
      if (this.estConnecte === false) {
        this.router.navigate(["/connexion"]);
      }
    });
  }

  /**
   * Fonction fait office de gardien décidant si un itinéraire peut être activé
   * @param route composant ActivatedRouteSnapshot
   * @param state composant RouterStateSnapshot
   * @returns Route activée
   */
  canActivate (
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    let valide = false;
    if (this.estConnecte) {
      valide = true;
    }
    if (valide) return true;
    else
      return this.router.parseUrl('/');
  }
}
