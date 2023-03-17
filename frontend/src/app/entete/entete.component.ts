import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';


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
    window.scroll({ // pour scroll up quand on clique sur une bouteille
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
    });

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
    window.scroll({ // pour scroll up quand on clique sur une bouteille
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
    });

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
}
