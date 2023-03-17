import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/shared/auth.service';
import { FormBuilder, FormGroup } from '@angular/forms';
import { TokenService } from 'src/app/shared/token.service';
import { AuthStateService } from 'src/app/shared/auth-state.service';
import { IUser } from '../iuser';

@Component({
  selector: 'app-connexion-admin',
  templateUrl: './connexion-admin.component.html',
  styleUrls: ['./connexion-admin.component.scss']
})

export class ConnexionAdminComponent implements OnInit {

  loginForm: FormGroup;
  errors:any = null;

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

  ngOnInit() {}

  onSubmit() {
    console.log('Je suis à l\'intérieur de connexion-admin.component.ts');
    console.log(this.loginForm.value.name);
    console.log(this.loginForm.value.email);
    console.log(this.authService.signin(this.loginForm.value) +' aqui');

    this.authService.signin(this.loginForm.value).subscribe(
      (result) => {
        console.log(result);
        this.responseHandler(result);
      },
      (error) => {
        this.errors = error.error;
      },
      () => {
        this.authState.setAuthState(true);
        this.loginForm.reset();
        // this.router.navigate(['profile']);
        this.router.navigate(['liste-usager']);
      }
    );
  }

  // Handle response
  responseHandler(data:any) {
    this.token.handleData(data.access_token);
  }
}
