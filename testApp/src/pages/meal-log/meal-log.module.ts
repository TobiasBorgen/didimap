import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { MealLogPage } from './meal-log';

@NgModule({
  declarations: [
    MealLogPage,
  ],
  imports: [
    IonicPageModule.forChild(MealLogPage),
  ],
})
export class MealLogPageModule {}
