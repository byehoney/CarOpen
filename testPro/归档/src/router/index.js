import React from 'react';
import { Route } from 'react-router-dom';
import Loadable from 'react-loadable';//组件切割 按需加载
const MyLoadingComponent = ()=>{
    return <div className="global_loading">加载中......</div>
}
const Index = Loadable({
    loader: () => import('../pages/index'),
    loading: MyLoadingComponent,
    delay:300
});
const Login = Loadable({
    loader: () => import('../pages/login'),
    loading: MyLoadingComponent,
    delay:300
});
const T = Loadable({
    loader: () => import('../pages/test'),
    loading: MyLoadingComponent,
    delay:300
});
export default ()=>[
    <Route path="/" component={Index} exact key="index" />,
    <Route path="/t" component={T} exact key="test" />,
    <Route path="/login" component={Login} exact key="login" />
]