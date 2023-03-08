import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModifCellierComponent } from './modif-cellier.component';

describe('ModifCellierComponent', () => {
  let component: ModifCellierComponent;
  let fixture: ComponentFixture<ModifCellierComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModifCellierComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ModifCellierComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
