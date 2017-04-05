enum Status {
    case wanna_watch
    case watching
    case watched
    case on_hold
    case stop_watching

    init?(kind: String) {
        switch kind {
        case "wanna_watch": self = .wanna_watch
        case "watching": self = .watching
        case "watched": self = .watched
        case "on_hold": self = .on_hold
        case "stop_watching": self = .stop_watching
        default: return nil
        }
    }
}
