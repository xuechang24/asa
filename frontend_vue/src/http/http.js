import * as login from './modules/login.js'
// import * as user from './modules/menu.js'
import {registry} from "./modules/registry"
import {updatePassword} from "./modules/updatePassword"
import * as file from "./modules/file"
import * as questionItem from "./modules/questionItem"
import * as questions from "./modules/questions"

export default {
    login,
    // user
    registry,
    updatePassword,
    file,
    questionItem,
    questions
}