import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FetchService } from '../fetch.service';
import { ActivatedRoute } from '@angular/router';
import { IlisteCellier } from '../iliste-cellier';
import { ICellier } from '../icellier';



import { Ilistemesbouteilles } from '../ilistemesbouteilles';
import { Imesbouteilles } from '../imesbouteilles';


// import { EffacerModalComponent } from '../effacer-modal/effacer-modal.component';

import { EffacerModalComponent } from '../effacer-cellier-modal/effacer-cellier-modal.component';

import { environment } from '../../environments/environment';


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
  listeMesBouteilles: Array<Imesbouteilles>;
  unCellier: ICellier;

  filteredData:any = [];
  searchTerm:any = '';
  minPrice:number;
  maxPrice:number;
  id: number;
  isVisible = false;
  spin: boolean = true;
  hide: boolean = true;
  display: number = 1;





  iconeTrash =  environment.baseImg + 'icones/trash-347.png';
  iconeModif =  environment.baseImg + 'icones/edit-black.png';
  iconeAjout =  environment.baseImg + 'icones/plus-black.png';
  iconeBouteille =  environment.baseImg + 'icones/wine-bottle.png';
  iconeCellier =  environment.baseImg + 'icones/wine-cellar.png';


  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
    private route: ActivatedRoute,
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
      this.spin = false;
      this.hide = false;
    });


  }

  // modal d'effacement

  openModal(id: number) {
   console.log(id);
   console.log(this.isVisible);
   this.id = id;
   this.isVisible = true;

  }

  closeModal() {
    this.isVisible = false;
  }

  onModalClosed() {
    this.isVisible = false;
  }


  rafraichirListe(){
    this.fetchService.getCelliers().subscribe((data: any) => {
      this.listeCelliers = data.data;
      console.log(this.listeCelliers);
      this.isVisible = false;
    });
  }


  openCellier(idCellier:number) {
    console.log('ouvre le cellier'+idCellier);
    this.router.navigateByUrl('profil/cellier/'+idCellier); 
  }

  changeDisplay(mode: number): void {
    this.display = mode;
  }



}
