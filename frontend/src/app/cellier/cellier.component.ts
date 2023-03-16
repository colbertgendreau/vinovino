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
  spin: boolean = true;
  hide: boolean = true;

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
          
          console.log('les bouteilles du cellier');
          console.log(this.bouteilles);
          this.spin = false;
          this.hide = false;
        
        });
    });
  }


  modifier(id:number, quantite:number) {
    console.log(id + "id");
    console.log(quantite + "quantite");


    this.fetchService.showBouteille(id).subscribe((data: any) => {
      this.bouteille = data.data;
      // this.bouteille.id = id;
      this.bouteille.quantite = quantite;
      
      
      let updateBouteille: Imesbouteilles = this.bouteille;
      console.log(updateBouteille);

      this.fetchService.modifBouteille(id, updateBouteille).subscribe((retour) => {
  
  
        this.route.params.subscribe((params) => {
  
          this.cellierId = params['id'];
    
    
          this.fetchService
            .getBouteillesCellier(params['id'])
            .subscribe((data: any) => {
              this.bouteilles = data.data;
  
            });
        });
        
      });
    });
    

  
  
}

 
}
