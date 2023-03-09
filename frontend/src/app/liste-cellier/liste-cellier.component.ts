import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FetchService } from '../fetch.service';
import { IlisteCellier } from '../iliste-cellier';
import { ICellier } from '../icellier';

// User interface
// export class User {
//   name: any;
//   email: any;
// }

@Component({
  selector: 'app-liste-cellier',
  templateUrl: './liste-cellier.component.html',
  styleUrls: ['./liste-cellier.component.scss']
})

export class ListeCellierComponent implements OnInit {

  isSignedIn!: boolean;
  // title:string='Liste des celliers';
  // UserProfile!: User;
  listeCelliers: Array<ICellier>; 

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
  ) {

    this.listeCelliers = [];

  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });

    this.fetchService.getCelliers().subscribe((data: any) => {
      this.listeCelliers = data.data;
      console.log(this.listeCelliers);
    });

    
  }

}
