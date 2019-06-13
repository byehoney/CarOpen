import React from 'react';
import ReactDOM from 'react-dom';
import { AppContainer } from 'react-hot-loader'; //热加载
import { HashRouter,BrowserRouter } from 'react-router-dom';
import {  Provider } from 'react-redux';
import { createStore,applyMiddleware,compose } from 'redux';
// 利用redux-logger打印日志
import {createLogger} from 'redux-logger'
// 安装redux-devtools-extension的可视化工具。
import { composeWithDevTools } from 'redux-devtools-extension'
import thunk from 'redux-thunk';
import ROOT_REDUCER from './redux/reducer';
import App from './App';
import * as serviceWorker from './serviceWorker';
const store = createStore(ROOT_REDUCER,compose(
    //异步
    applyMiddleware(thunk),
    window.devToolsExtension ? window.devToolsExtension() : f => f
  )
);
// 使用日志打印方法， collapsed让action折叠
const loggerMiddleware = createLogger({collapsed: true});

const render = (Component)=>{
    ReactDOM.render(
        (
            <AppContainer>
                <Provider store={store}>
                    <BrowserRouter>
                        <Component />
                    </BrowserRouter>
                </Provider>
            </AppContainer>       
        ), 
        document.getElementById('root')
    );
}
render(App);
if (module.hot) {
    module.hot.accept('./App', () => {
      render(App)
    })
}


// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister();
