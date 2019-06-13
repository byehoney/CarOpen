import React,{ Component } from 'react';
import Head from '../components/header';
import Foot from '../components/footer'
import Con from '../containers/center'
export default class Index extends Component{
    constructor(props){
        super(props);
    }
    render(){
        return(
            <React.Fragment>
                <Head />
                <Con/>
                <Foot/>
            </React.Fragment>
        )
    }
}