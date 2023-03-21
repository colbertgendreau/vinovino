import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from 'projects/admin/src/app/shared/token.service';
import { AuthStateService } from 'projects/admin/src/app/shared/auth-state.service';
import { AuthService } from 'projects/admin/src/app/shared/auth.service';

@Component({
  selector: 'app-liste-catalogue',
  templateUrl: './liste-catalogue.component.html',
  styleUrls: ['./liste-catalogue.component.scss']
})
export class ListeCatalogueComponent implements OnInit {

  isSignedIn! : boolean;
  isOpen : boolean = true;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
  ) {}

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
      // this.isOpen = !this.isOpen;
      // console.log(this.isOpen);
    });
  }

}
