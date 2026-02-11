import { type ContentProps } from "../../components/content";
import { deleteUser, getUsers } from "../../services/userService";
import deleteButtonDisabledImg from '../../assets/deleteButtonDisabled.svg';
import deleteButtonImg from '../../assets/deleteButton.svg';
import editButtonImg from '../../assets/editButton.svg';
import formsButtonImg from '../../assets/formsButton.svg';
import { useAuth } from "../../contexts/AuthContext";
import { useState } from "react";

export interface User {
    id: string,
    name: string,
    email: string,
    userPic: string,
    role: { name: string },
}

function UserActions({ item, refresh }: { item: User, refresh: () => void }) {
    const { user } = useAuth();
    const [deleteLoading, setDeleteLoading] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);

    async function handleSubmit(e: React.FormEvent<HTMLFormElement>, id: string) {
        e.preventDefault();
        setDeleteLoading(true);
        try {
            await deleteUser(id);
            refresh();
            setShowDeleteModal(false);
        } catch (error) {
            console.error(error);
        } finally {
            setDeleteLoading(false);
        }
    }

    return (
        <div className="flex justify-end gap-2">
            <button title='Permissões' className="size-8">
                <img src={formsButtonImg} alt="Forms button" />
            </button>
            <button title='Editar' className="size-8">
                <img src={editButtonImg} alt="Edit button" />
            </button>
            <button
                onClick={() => setShowDeleteModal(true)}
                className={`size-8 ${item.id === user?.id ? '' : 'cursor-pointer'}`}
                disabled={item.id === user?.id}
                title="Excluir"
            >
                <img src={item.id === user?.id ? deleteButtonDisabledImg : deleteButtonImg} alt="Delete button" />
            </button>

            {showDeleteModal && (
                <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                    <div className="relative flex flex-col bg-white w-[640px] h-[240px] justify-center items-center rounded-2xl shadow-xl p-10">

                        <button
                            onClick={() => setShowDeleteModal(false)}
                            className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                        >
                            ✕
                        </button>

                        <form onSubmit={(e) => handleSubmit(e, item.id)} className="w-full h-full flex flex-col items-center justify-center">
                            <p className="text-xl text-center">Deseja realmente excluir o usuário <span className="font-bold">{item.name}</span> ?</p>
                            <button
                                type="submit"
                                className="w-full h-14 rounded-md bg-standard-blue text-white text-xl font-bold mt-6 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed"
                                disabled={deleteLoading}
                            >
                                {deleteLoading ? 'AGUARDE...' : 'CONFIRMAR'}
                            </button>
                        </form>
                    </div>
                </div>
            )}
        </div>
    );
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
    renderActions: (item: User, _isExpanded: boolean, _toggle: (id: string) => void, refresh: () => void) => (
        <UserActions item={item} refresh={refresh} />
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
