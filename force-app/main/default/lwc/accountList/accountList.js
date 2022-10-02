import {
    LightningElement,
    wire,
    track
} from 'lwc';


import getAccountList from '@salesforce/apex/AccountLWCController.getAccountList';
import getShowroom from '@salesforce/apex/AccountLWCController.getShowroom';
import getVehicle from '@salesforce/apex/AccountLWCController.getVehicle';


export default class AccountList extends LightningElement {

    @track accountId = '';
    @track showroomId;
    @track showrooms;
    @track vehicles;
    @track vehicleId;

    @wire(getAccountList) accounts;
    @wire(getShowroom, {
        accountId: '$accountId'
    }) showrooms;
    @wire(getVehicle, {
        showroomId: '$showroomId'
    }) vehicles;

    onAccountSelection(event) {
        const selectedAccount = event.target.value;
        this.accountId = event.target.value;
    }

    onShowroomSelection(event) {
        const selectedShowroom = event.target.value;
        this.showroomId = event.target.value;
        // if (selectedShowroom != null) {
        //     getVehicle({
        //             showroomId: selectedShowroom
        //         })
        //         .then(result => {
        //             this.vehicles = result;
        //             // eslint-disable-next-line no-console
        //             console.log('result' + JSON.stringify(result) + selectedShowroom);
        //         })
        //         .catch(error => {
        //             this.error = error;
        //         });
        // }
    }

    onVehicleSelection(event) {
        const selectedVehicles = event.target.value;
        this.vehicleId = event.target.value;
    }

}