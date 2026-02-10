import { type ContentProps } from "../../components/content";
import { getUsers } from "../../services/userService";

export interface User {
    id: string,
    name: string,
    email: string,
    userPic: string,
    role: { name: string },
}

export const UsersContentDefinition = {
    id: 'usuarios',
    label: 'Usuários',
    columns: [
        {
            key: 'name',
            label: 'Nome',
            width: 'w-1/5'
        },
        {
            key: 'email',
            label: 'E-mail',
            width: 'w-3/5'
        }
    ],
    rowIdField: 'id' as keyof User,
    renderActions: (_item: User, _isExpanded: boolean, _toggle: (id: string) => void) => (
        <div className="flex justify-end gap-2">
            <button title='Permissões' className="bg-standard-blue">📄</button>
            <button title='Editar' className="bg-standard-blue">✏️</button>
            <button title='Excluir' className="bg-standard-blue">🗑️</button>
        </div>
    ),
    toolBar: (
        <div className="gap-4 bg-form-bg p-4 rounded-md mx-6 mb-6">
            <h3 className="font-bold text-text-main uppercase text-xs mb-2">Adicionar usuário</h3>
            <form className="grid grid-cols-4 gap-4">
                <input type='text' placeholder='Nome' className="bg-white border border-border p-2 rounded" />
                <input type='text' placeholder='Email' className="bg-white border border-border p-2 rounded" />
                <input type='text' placeholder='Senha' className="bg-white border border-border p-2 rounded" />
                <button className="bg-standard-blue text-white font-bold cursor-pointer px-4 rounded">Adicionar</button>
            </form>
        </div>
    )
};

export const fetchUsersData = async () => {
    return getUsers();
};

export const UsersPermissionsContent: ContentProps<User> = {
    ...UsersContentDefinition,
    data: [],
} as unknown as ContentProps<User>;
