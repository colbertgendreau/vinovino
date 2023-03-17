import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from 'src/app/shared/token.service';
import { AuthStateService } from 'src/app/shared/auth-state.service';

@Component({
  selector: 'app-entete',
  templateUrl: './entete.component.html',
  styleUrls: ['./entete.component.scss']
})

export class EnteteComponent {
  isSignedIn!: boolean;
  // isOpen:boolean = false;

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
  
  signOut() {
    this.auth.setAuthState(false);
    this.token.removeToken();
    this.router.navigate(['admin']);
    // this.isOpen = !this.isOpen;
  }

  // onToggle(checked: boolean): void {
  //   this.isOpen = checked;
  // }

  // get menuClass() {
  //   return this.isOpen ? 'menu open' : 'menu';
  // }
}
