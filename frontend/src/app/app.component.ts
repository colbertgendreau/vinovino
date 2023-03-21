import { Component, OnInit, isDevMode } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from './shared/token.service';
import { AuthStateService } from './shared/auth-state.service';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})

export class AppComponent implements OnInit {
  isSignedIn!: boolean;
  title:string='FrontEnd';
  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService
  ) {}
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
  // Signout
  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['']);
  }
}
