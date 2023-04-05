import { Component, OnInit, isDevMode } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'projects/admin/src/app/shared/auth.service';
import { FormBuilder, FormGroup } from '@angular/forms';
import { TokenService } from 'projects/admin/src/app/shared/token.service';
import { AuthStateService } from 'projects/admin/src/app/shared/auth-state.service';

@Component({
  selector: 'app-connexion-admin',
  templateUrl: './connexion-admin.component.html',
  styleUrls: ['./connexion-admin.component.scss']
})

export class ConnexionAdminComponent implements OnInit {

  isSignedIn!: boolean;
  isOpen: boolean = true;
  loginForm: FormGroup;
  errors: any = null;
  erreur: any;

  /**
   * Constructeur de la classe ConnexionAdminComponent
   * @param router composant Router
   * @param fb composant FormBuilder
   * @param authService composant AuthService
   * @param token composant TokenService
   * @param authState composant AuthStateService
   */
  constructor(
    public router: Router,
    public fb: FormBuilder,
    public authService: AuthService,
    private token: TokenService,
    private authState: AuthStateService
  ) {
    this.loginForm = this.fb.group({
      email: [],
      password: [],
    });
  }

  /**
   * Fonction initiale dès l'instanciation de la classe
   */
  ngOnInit() {
    this.authState.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      this.isOpen = !this.isOpen;
    });
  }

  /**
   * Fonction qui permet de se connecter en tant qu'administrateur
   */
  onSubmit() {
    this.authService.signin(this.loginForm.value).subscribe(
      (result) => {
        this.responseHandler(result);
        if (result.user.type === "1") {
          this.authState.setAuthState(true);
          this.loginForm.reset();
          this.router.navigate(['admin/liste-usager']);
        } else if (result.user.type === "0") {
          this.loginForm.reset();
          this.router.navigate(['admin']);
          this.erreur = "Vous avez besoin d'une autorisation que seul un administrateur peut accorder. Veuillez demander à un administrateur d'accorder une autorisation à cette application avant de pouvoir l'utiliser.";
        }
      },
      (error) => {
        this.errors = error.error;
      },
    );
  }

  /**
   * Handle response
   * @param data any - Data du token
   */
  responseHandler(data: any) {
    this.token.handleData(data.access_token);
  }

  /**
   * Fonction qui permet à un administrateur de se déconnecter
   */
  signOut() {
    this.authState.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['admin']);
  }
}