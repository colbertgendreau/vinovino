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

  isSignedIn! : boolean;
  isOpen : boolean = true;

  loginForm: FormGroup;
  errors:any = null;
  erreur:any;

  constructor(
    public router: Router,
    public fb: FormBuilder,
    public authService: AuthService,
    private token: TokenService,
    private authState: AuthStateService
  ) {

    // console.log(token);
    // console.log(authService);
    // console.log(authState);

    this.loginForm = this.fb.group({
      email: [],
      password: [],
      // type: [],
    });
  }

  ngOnInit() {

    // console.log(this.auth.userAuthState);
    this.authState.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
      this.isOpen = !this.isOpen;
      // console.log(this.isOpen);
    });
  }

  onSubmit() {


    // this.authService.signinAdmin(this.loginForm.value).subscribe(

    this.authService.signin(this.loginForm.value).subscribe(
      (result) => {
        this.responseHandler(result);
        console.log(result);
        if (result.user.type === "1") {
          console.log("liste-usager 1")
          this.authState.setAuthState(true);
          this.loginForm.reset();
          console.log("liste-usager 1")

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
      // () => {
      //   this.authState.setAuthState(true);
      //   this.loginForm.reset();
      //   this.router.navigate(['liste-usager']);
      // }


      // (result) => {
      //   this.responseHandler(result);
      //   console.log(result);
      // },
      // (error) => {
      //   console.log(error);
      //   this.errors = error.error;
      // },
      // () => {
      //   this.authState.setAuthState(true);
      //   this.loginForm.reset();
      //   this.router.navigate(['liste-usager']);
      // }
    );
  }

  // Handle response
  responseHandler(data:any) {
    this.token.handleData(data.access_token);
  }

  signOut() {
    this.authState.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['admin']);
  }

}
