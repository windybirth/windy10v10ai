
import { MemberDto, PlayerDto } from "./player";

declare global {
    interface CustomNetTableDeclarations {
        loading_status: {
            loading_status: any;
        };
        ending_status: {
            ending_status: any;
        };
        member_table: {
            [steamId: string]: MemberDto;
        };
        player_table: {
            [steamId: string]: PlayerDto;
        };
    }
    function TsPrint(...args: any[]): void;
}

