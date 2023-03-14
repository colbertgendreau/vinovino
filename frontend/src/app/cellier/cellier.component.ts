import { Component, OnInit, Input, Output } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ICellier } from '../icellier';
import { FetchService } from '../fetch.service';
import { ActivatedRoute } from '@angular/router';
import { Ibouteillecellier } from '../ibouteille-cellier';
import { Imesbouteilles } from '../imesbouteilles';

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

  bouteilles: Array<Ibouteillecellier>;
  bouteille: Imesbouteilles;
  cellierId: string;
  isSignedIn!: boolean;
  // title:string='Cellier';
  UserProfile!: User;
  unCellier: any;

//   counter:number = 1;
  counterValue:number = 0;
  quantite:number;
  id:number;


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
    this.bouteilles = [];

    
  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });


    this.route.params.subscribe((params) => {

      this.cellierId = params['id'];
      console.log(params['id']);


      this.fetchService
        .getBouteillesCellier(params['id'])
        .subscribe((data: any) => {
          this.bouteilles = data.data;
          
          console.log(this.bouteilles);
          console.log('les bouteilles du cellier');
        });
    });
  }
  plus(id:number, quantite:number) {
    console.log("plus");

    this.quantite = quantite;
    this.quantite++;

    console.log(this.quantite);
    console.log(id);
    
           
        this.fetchService.showBouteille(id).subscribe((data: any) => {
          this.bouteille = data.data;
          console.log(this.bouteille);
        //   this.modifBouteilleForm.setValue({
        //     id_bouteillePerso: this.bouteille.id,
        //     nom_bouteillePerso: this.bouteille.nom_bouteillePerso,
        //     type_bouteillePerso: this.bouteille.type_bouteillePerso,
        //     pays_bouteillePerso: this.bouteille.pays_bouteillePerso,
        //     format_bouteillePerso: this.bouteille.format_bouteillePerso,
        //     prix_bouteillePerso: this.bouteille.prix_bouteillePerso,
        //     quantite_bouteillePerso: this.bouteille.quantite,
        //     description_bouteillePerso: this.bouteille.description_bouteillePerso
        //   });
        });
  



    // this.quantite = quantite;

    
    // this.quantite = this.counter;
    // console.log(this.quantite);

    // this.counter ++;
    // console.log(this.counter);

    // this.route.params.subscribe((params) => {
    //     let updateBouteille: Imesbouteilles = this.modifBouteilleForm.value;

    //     this.fetchService.modifBouteille(params['id'], updateBouteille).subscribe((retour) => {
    //       this.router.navigate(['liste-cellier']);
    //     });
    // });

    
  }

  moins() {
    console.log("moins");
    
  }
}
