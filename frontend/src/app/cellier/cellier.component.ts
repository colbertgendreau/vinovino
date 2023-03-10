import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ICellier } from '../icellier';
import { Ilistemesbouteilles } from '../Ilistemesbouteilles';
import { FetchService } from '../fetch.service';
import { Imesbouteilles } from '../imesbouteilles';
import { ActivatedRoute } from '@angular/router';

// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-cellier',
  templateUrl: './cellier.component.html',
  styleUrls: ['./cellier.component.scss'],
})
export class CellierComponent implements OnInit {
  @Input() cellier: ICellier;

  bouteilles: Array<Imesbouteilles>;

  isSignedIn!: boolean;
  // title:string='Cellier';
  UserProfile!: User;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
    private route: ActivatedRoute
  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      console.log(this.UserProfile);
    });
  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });
    console.log("les bouteilles du cellier");

    this.route.params.subscribe((params) => {
      console.log(params);

      this.fetchService
        .getBouteillesCellier(params['id'])
        .subscribe((data: any) => {
          this.bouteilles = data.data;
          console.log(this.bouteilles);
          console.log("les bouteilles du cellier");
        });
    });
  }
}
