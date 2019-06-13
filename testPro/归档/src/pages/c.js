import React,{ Component } from 'react';
export default class C extends Component{
    constructor(props){
        super(props);
        this.state = {
            num:2
        }
    }
    static getDerivedStateFromProps(nextprops,state){
        console.log(nextprops,state)
        let { num } = state;
        if(nextprops.num!=num){
            console.log(1111);
            return {
                num :nextprops.num
            }
            // this.setState({
            //     num:nextprops.num
            // })
        }else{
            console.log(2222)
        }

    }
    render(){
        let { num } = this.state;
        console.log('render')
        return(
            <div>
                111111-----{num}
            </div>
        )
    }
}
