export interface Imesbouteilles {
    id?:number;
    id_supreme?:number;
    prix?:number;
    celliers_id:any;
    id_bouteille:number;
    nom: string;
    type: number;
    type_vino_name: string;
    type_mes_name: string;
    pays: string;
    format: string;
    prix_saq: number;
    quantite: number;
    description: string;
    id_mes_bouteilles:number;
    url_img: string;
    url_saq: string;
    id_cellier: any;
    notes?: number;

    id_bouteillePerso: number;
    nom_bouteillePerso: string;
    type_bouteillePerso: number;
    pays_bouteillePerso: string;
    format_bouteillePerso: string;
    prix_bouteillePerso: number;
    quantite_bouteillePerso: number;
    description_bouteillePerso: string;
    cellier_nom:string;

}
