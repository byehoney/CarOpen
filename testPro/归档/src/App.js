import React from 'react'
import { Switch } from 'react-router-dom';
import Router from './router/index';
import './index.css'
export default class App extends React.Component {
  render() {
    return (
      <Switch>
          <Router />
      </Switch>   
    );
  }
}

