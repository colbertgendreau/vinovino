import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/shared/auth.service';
import { FormBuilder, FormGroup } from '@angular/forms';
import { TokenService } from 'src/app/shared/token.service';
import { AuthStateService } from 'src/app/shared/auth-state.service';

@Component({
  selector: 'app-connexion-admin',
  templateUrl: './connexion-admin.component.html',
  styleUrls: ['./connexion-admin.component.scss']
})

export class ConnexionAdminComponent implements OnInit {

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
      type: [],
    });
  }

  ngOnInit() {}

  onSubmit() {
    // console.log('Je suis à l\'intérieur de connexion-admin.component.ts');
    // console.log(this.loginForm.value.password);
    // console.log(this.loginForm.value.email);
    // console.log(this.authService.signinAdmin(this.loginForm.value) +' aqui');

    // console.log(this.loginForm);

    this.authService.signinAdmin(this.loginForm.value).subscribe(
      (result) => {
        this.responseHandler(result);
        if (result.user.type === "1") {
          this.authState.setAuthState(true);
          this.loginForm.reset();
          this.router.navigate(['liste-usager']);
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
    );
  }

  // Handle response
  responseHandler(data:any) {
    this.token.handleData(data.access_token);
  }
}
