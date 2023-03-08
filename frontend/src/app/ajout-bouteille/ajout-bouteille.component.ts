import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';

import { IBouteille } from '../ibouteille';
import { FetchService } from '../fetch.service';

// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-ajout-bouteille',
  templateUrl: './ajout-bouteille.component.html',
  styleUrls: ['./ajout-bouteille.component.scss']
})

export class AjoutBouteilleComponent implements OnInit{
  
  isSignedIn!: boolean;
  // title:string='Ajouter une bouteille';
  UserProfile!: User;

  arrayBouteille:Array<IBouteille>;
  
  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchSaq:FetchService,
  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      console.log(this.UserProfile);
    });
    this.arrayBouteille = [];
  }

 

  ngOnInit(): void {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });
    
    this.fetchSaq.getBouteilleSAQ().subscribe((response) => {
      this.arrayBouteille = response.data;
    });
  }


}
