import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-effacer-modal',
  templateUrl: './effacer-modal.component.html',
  styleUrls: ['./effacer-modal.component.scss']
})
export class EffacerModalComponent {
  @Input() isVisible: boolean;
  @Output() deleteConfirmed = new EventEmitter();

  onDelete() {
    this.deleteConfirmed.emit();
    this.isVisible = false;
  }
}
