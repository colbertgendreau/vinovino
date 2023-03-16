import { Component } from '@angular/core';

@Component({
  selector: 'app-spinner-overlay-wrapper',
  templateUrl: './spinner-overlay-wrapper.component.html',
  styleUrls: ['./spinner-overlay-wrapper.component.scss']
})
export class SpinnerOverlayWrapperComponent {
    showSpinner: boolean = true;


    ngOnInit() {
        this.showSpinner = true;

    }

}
