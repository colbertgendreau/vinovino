import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ActivatedRoute } from '@angular/router';
import { FetchService } from '../fetch.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material/snack-bar';
import { Imesbouteilles } from '../imesbouteilles';
import { environment } from '../../environments/environment';


// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-detail-bouteille',
  templateUrl: './detail-bouteille.component.html',
  styleUrls: ['./detail-bouteille.component.scss']
})
export class DetailBouteilleComponent {

  isSignedIn!: boolean;
  // title:string='Liste des celliers';
  UserProfile!: User;
  uneBouteille: Imesbouteilles;
  spin: boolean = true;
  hide: boolean = true;

  imgBouteilleNonDisponible = environment.baseImg + 'img/nonDispo.webp';

  isVisible = false;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    private route: ActivatedRoute,
    public fetchService: FetchService,
    private formBuilder: FormBuilder,
    private snackBar: MatSnackBar

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

    this.route.params.subscribe((params) => {
      console.log(params);

      this.fetchService.showDetail(params['id']).subscribe((data: any) => {
        this.uneBouteille = data.data;
        console.log(this.uneBouteille);

        this.spin = false;
        this.hide = false;
      });
    })
  }



}
