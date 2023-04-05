import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FetchService } from '../fetch.service';
import { ActivatedRoute } from '@angular/router';
import { ICellier } from '../icellier';
import { Imesbouteilles } from '../imesbouteilles';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-liste-cellier',
  templateUrl: './liste-cellier.component.html',
  styleUrls: ['./liste-cellier.component.scss']
})

export class ListeCellierComponent implements OnInit {

  isSignedIn!: boolean;
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

  /**
   * a l'initialisation, on fetch tout les celliers du user
   */
  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });

    this.fetchService.getCelliers().subscribe((data: any) => {
      this.listeCelliers = data.data;
      this.spin = false;
      this.hide = false;
    });


  }

 
/**
 * function qui ouvre le modal
 * @param id id de la bouteille quon veux supprimer
 */
  openModal(id: number) {
   this.id = id;
   this.isVisible = true;
  }

  /**
   * function qui ferme le modal
   */
  closeModal() {
    this.isVisible = false;
  }

  onModalClosed() {
    this.isVisible = false;
  }


  /**
   * function qui refetch quand on ajoute ou supprime
   */
  rafraichirListe(){
    this.fetchService.getCelliers().subscribe((data: any) => {
      this.listeCelliers = data.data;
      this.isVisible = false;
    });
  }

/**
 * function de navigation vers le cellier pour voir le detail
 * @param idCellier cellier quon click pour ouvrir
 */
  openCellier(idCellier:number) {
    this.router.navigateByUrl('profil/cellier/'+idCellier); 
  }

  changeDisplay(mode: number): void {
    this.display = mode;
  }



}
