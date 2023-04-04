import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { environment } from '../../environments/environment';


// import { AuthService } from '../shared/auth.service';

// // User interface
// export class User {
//   name: any;
//   email: any;
// }

@Component({
  selector: 'app-entete',
  templateUrl: './entete.component.html',
  styleUrls: ['./entete.component.scss'],
})

export class EnteteComponent implements OnInit {
  isSignedIn!: boolean;
  title: string = 'FrontEnd';
  isOpen: boolean = false;
  isVisibleM = false;
  iconeLoupe = environment.baseImg + 'icones/loupe.png';

  /**
   * Constructeur de la classe EnteteComponent
   * @param auth composant AuthStateService
   * @param router composant Router
   * @param token composant TokenService
   */
  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService
  ) { }

  /**
   * Fonction initiale dès l'instanciation de la classe
   */
  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });
  }

  /**
   * Fonction qui permet la navigation vers la page d'accueil
   */
  pageAccueil() {
    this.router.navigate(['accueil']);
    this.isOpen = !this.isOpen;
  }

  /**
   * Fonction qui permet la navigation vers la page des celliers
   */
  pageCelliers() {
    // pour remonter vers le haut de la page quand on clique sur une bouteille
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
    this.router.navigate(['/profil/liste-cellier']);
    this.isOpen = !this.isOpen;
  }

  /**
   * Fonction qui permet la navigation vers la page des bouteilles archivées
   */
  pageArchive() {
    // pour remonter vers le haut de la page
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
    this.router.navigate(['/profil/archive']);
    this.isOpen = !this.isOpen;
  }

  /**
   * Fonction qui permet la navigation vers la page de connexion
   */
  pageConnexion() {
    this.router.navigate(['connexion']);
    this.isOpen = !this.isOpen;
  }

  /**
   * Fonction qui permet la navigation vers la page d'inscription
   */
  pageInscription() {
    this.router.navigate(['inscription']);
    this.isOpen = !this.isOpen;
  }

  /**
   * Fonction qui permet la déconnexion de la session
   */
  signOut() {
    // pour remonter vers le haut de la page
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['connexion']);
    this.isOpen = !this.isOpen;
  }

  /**
   * Fonction qui permet l'ouverture et la fermeture du menu burger de l'entête
   * @param checked - booléen Vrai ou faux
   */
  onToggle(checked: boolean): void {
    this.isOpen = checked;
  }

  /**
   * Menu burger ouvert ou fermé selon le toggle
   */
  get menuClass() {
    return this.isOpen ? 'menu open' : 'menu';
  }
}
