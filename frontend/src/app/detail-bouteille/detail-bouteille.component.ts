import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ActivatedRoute } from '@angular/router';
import { FetchService } from '../fetch.service';
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
  UserProfile!: User;
  uneBouteille: Imesbouteilles;
  spin: boolean = true;
  hide: boolean = true;
  fullImage1 = false;
  showImage = false;
  cepage_lisible: string;
  imgBouteilleNonDisponible = environment.baseImg + 'img/nonDispo.webp';
  isVisible = false;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    private route: ActivatedRoute,
    public fetchService: FetchService,
  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
    });
  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });
    this.route.params.subscribe((params) => {
      this.fetchService.showDetail(params['id']).subscribe((data: any) => {
        this.uneBouteille = data.data;
        if (this.uneBouteille.prix_bouteillePerso) {
          this.uneBouteille.prix_bouteillePerso = (this.uneBouteille.prix_bouteillePerso.toFixed(2));
        }
        if (this.uneBouteille.prix_saq) {
          this.uneBouteille.prix_saq = (this.uneBouteille.prix_saq.toFixed(2));
        }
        if (this.uneBouteille.cepages) {
          let chaine = this.uneBouteille.cepages;
          let objet = JSON.parse(chaine);
          let listeCepages = Array.from(objet);
          let cepage: string = listeCepages.join(" ");
          this.cepage_lisible = cepage.replace(/\u00a0/g, " ");
        }
        this.spin = false;
        this.hide = false;
      });
    })
  }
}
