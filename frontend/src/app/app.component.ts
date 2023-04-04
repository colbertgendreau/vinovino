import { Component, OnInit, isDevMode } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from './shared/token.service';
import { AuthStateService } from './shared/auth-state.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})

export class AppComponent implements OnInit {
  isSignedIn!: boolean;
  title: string = 'FrontEnd';

  /**
   * Constructeur de la classe AppComponent
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
    if (isDevMode()) {
      console.log('Development!');
    } else {
      console.log('Production!');
    }
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });
  }

  /**
   * Fonction qui permet de se déconnecter de l'application
   */
  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['']);
  }
}
