import { Component, OnInit, isDevMode } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from 'src/app/shared/token.service';
import { AuthStateService } from 'src/app/shared/auth-state.service';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
  title : string = 'admin';
  isSignedIn! : boolean;
  isOpen : boolean = true;

  constructor(
    private auth:AuthStateService,
    public router:Router,
    public token:TokenService,
    ) {}

  ngOnInit(): void {
    if (isDevMode()) {
      console.log('Development!');
    } else {
      console.log('Production!');
    }
    // console.log(this.auth.userAuthState);
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
      this.isOpen = !this.isOpen;
      // console.log(this.isOpen);
    });
  }

  // pageListeUsager() {
  //   this.router.navigate(['liste-usager']);
  // }

  // pageCatalogue() {
  //   this.router.navigate(['catalogue']);
  // }

  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['admin']);
  }

}
