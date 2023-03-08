import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
// import { TokenService } from './shared/token.service';
import { TokenService } from '../shared/token.service';
// import { AuthStateService } from './shared/auth-state.service';
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
  // Signout
  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['accueil']);
  }
}
