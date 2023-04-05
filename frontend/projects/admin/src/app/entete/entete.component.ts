import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from 'projects/admin/src/app/shared/token.service';
import { AuthStateService } from 'projects/admin/src/app/shared/auth-state.service';

@Component({
  selector: 'app-entete',
  templateUrl: './entete.component.html',
  styleUrls: ['./entete.component.scss']
})

export class EnteteComponent {
  isSignedIn!: boolean;

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
   * Fonction qui permet à un administrateur de se déconnecter de l'interface admin
   */
  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['admin']);
  }
}