import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { RechercherModalComponent } from '../rechercher-modal/rechercher-modal.component';


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
  title:string='FrontEnd';
  isOpen:boolean = false;
  isVisibleM = false;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService
    ) {}
  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });
  }

  pageAccueil() {
    this.router.navigate(['accueil']);
    this.isOpen = !this.isOpen;
  }

  pageCelliers() {
    this.router.navigate(['liste-cellier']);
    this.isOpen = !this.isOpen;
  }

  pageConnexion() {
    this.router.navigate(['connexion']);
    this.isOpen = !this.isOpen;
  }

  pageProfil() {
    this.router.navigate(['profile']);
    this.isOpen = !this.isOpen;
  }

  pageInscription() {
    this.router.navigate(['inscription']);
    this.isOpen = !this.isOpen;
  }
  
  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['']);
    this.isOpen = !this.isOpen;
  }

  onToggle(checked: boolean): void {
    this.isOpen = checked;
  }

  get menuClass() {
    return this.isOpen ? 'menu open' : 'menu';
  }

  openModalFilter() {
    this.isVisibleM = true;
  }
  closeModalFilter() {
    this.isVisibleM = false;
  }
  onModalClosed() {
    this.isVisibleM = false;
  }
}
