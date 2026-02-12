import { type ContentProps } from "../../components/content";
import { deleteUser, getUsers, updateUserDetails } from "../../services/userService";
import deleteButtonDisabledImg from '../../assets/deleteButtonDisabled.svg';
import deleteButtonImg from '../../assets/deleteButton.svg';
import editButtonImg from '../../assets/editButton.svg';
import formsButtonImg from '../../assets/formsButton.svg';
import userImg from '../../assets/loginUser.svg';
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
    const [loading, setLoading] = useState(false);
    const [showEditModal, setShowEditModal] = useState(false);
    const [error, setError] = useState<{ name?: string, email?: string, role?: string } | null>(null);

    const [editName, setEditName] = useState(item.name);
    const [editEmail, setEditEmail] = useState(item.email);
    const [editRole, setEditRole] = useState(item.role?.name || '');
    const [showDeleteModal, setShowDeleteModal] = useState(false);


    async function handleSubmitEdit(e: React.FormEvent<HTMLFormElement>, item: User) {
        e.preventDefault();
        setLoading(true);
        setError(null);
        try {
            await updateUserDetails(item.id, editName, editEmail, editRole);
            refresh();
            setShowEditModal(false);
        } catch (error: any) {
            console.error(error);
            if (error.status === 409) {
                setError({ email: 'Email já cadastrado' });
            } else {
                setError({ email: error.response?.data?.message || 'Erro ao atualizar usuário' });
            }
        } finally {
            setLoading(false);
        }
    }

    async function handleSubmitDelete(e: React.FormEvent<HTMLFormElement>, id: string) {
        e.preventDefault();
        setLoading(true);
        try {
            await deleteUser(id);
            refresh();
            setShowDeleteModal(false);
        } catch (error) {
            console.error(error);
        } finally {
            setLoading(false);
        }
    }

    return (
        <div className="flex justify-end gap-2">
            <button title='Permissões' className="size-8 cursor-pointer">
                <img src={formsButtonImg} alt="Forms button" />
            </button>
            <button onClick={() => {
                setEditName(item.name);
                setEditEmail(item.email);
                setEditRole(item.role?.name || '');
                setError(null);
                setShowEditModal(true);
            }} className="size-8 cursor-pointer">
                <img src={editButtonImg} alt="Edit button" />
            </button>
            <button
                onClick={() => setShowDeleteModal(true)}
                className={`size-8 ${item.id === user?.id || item.role?.name === 'owner' || item.role?.name === 'admin' ? '' : 'cursor-pointer'}`}
                disabled={item.id === user?.id || item.role?.name === 'owner' || item.role?.name === 'admin'}
                title="Excluir"
            >
                <img src={item.id === user?.id || item.role?.name === 'owner' || item.role?.name === 'admin' ? deleteButtonDisabledImg : deleteButtonImg} alt="Delete button" />
            </button>

            {showEditModal && (
                <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                    <div className="relative flex flex-col bg-white w-160 h-140 justify-center items-center rounded-2xl shadow-xl p-10">
                        <button
                            onClick={() => setShowEditModal(false)}
                            className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                        >
                            ✕
                        </button>

                        <form onSubmit={(e) => handleSubmitEdit(e, item)} className="w-full h-full flex flex-col items-center justify-between">
                            <div className="flex justify-center items-center rounded-full overflow-hidden size-24 bg-[#444141]">
                                <img src={item.userPic || userImg} alt="User picture" />
                            </div>

                            <div className="w-full flex flex-col gap-4">
                                <div className="flex flex-col">
                                    <label htmlFor="name" className="text-sm text-left font-bold mb-1">Nome</label>
                                    <input
                                        type="text"
                                        id="name"
                                        value={editName}
                                        onChange={(e) => { setEditName(e.target.value); setError(null); }}
                                        className="border border-border rounded p-2"
                                    />
                                    {error?.name && <p className="text-red-500 text-left text-sm">{error.name}</p>}
                                </div>
                                <div className="flex flex-col">
                                    <label htmlFor="email" className="text-sm text-left font-bold mb-1">Email</label>
                                    <input
                                        type="email"
                                        id="email"
                                        value={editEmail}
                                        onChange={(e) => { setEditEmail(e.target.value); setError(null); }}
                                        className="border border-border rounded p-2"
                                    />
                                    {error?.email && <p className="text-red-500 text-left text-sm">{error.email}</p>}
                                </div>
                                <div className="flex flex-col">
                                    <label htmlFor="role" className="text-sm text-left font-bold mb-1">Função</label>
                                    <select
                                        id="role"
                                        value={editRole}
                                        onChange={(e) => { setEditRole(e.target.value); setError(null); }}
                                        className="border border-border rounded p-2 bg-white"
                                    >
                                        <option value="user">Usuário</option>
                                        <option value="admin">Administrador</option>
                                    </select>
                                    {error?.role && <p className="text-red-500 text-left text-sm">{error.role}</p>}
                                </div>
                            </div>

                            <button
                                type="submit"
                                className="w-full h-14 rounded-md bg-standard-blue text-white text-xl font-bold mt-6 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed"
                                disabled={loading}
                            >
                                {loading ? 'AGUARDE...' : 'CONFIRMAR'}
                            </button>
                        </form>
                    </div>
                </div>
            )}

            {showDeleteModal && (
                <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                    <div className="relative flex flex-col bg-white w-160 h-60 justify-center items-center rounded-2xl shadow-xl p-10">

                        <button
                            onClick={() => setShowDeleteModal(false)}
                            className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                        >
                            ✕
                        </button>

                        <form onSubmit={(e) => handleSubmitDelete(e, item.id)} className="w-full h-full flex flex-col items-center justify-center">
                            <p className="text-xl text-center">Deseja realmente excluir o usuário <span className="font-bold">{item.name}</span> ?</p>
                            <button
                                type="submit"
                                className="w-full h-14 rounded-md bg-standard-blue text-white text-xl font-bold mt-6 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed"
                                disabled={loading}
                            >
                                {loading ? 'AGUARDE...' : 'CONFIRMAR'}
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
    firstColumnDetail: (item: User) => (
        (item.role?.name === 'admin' || item.role?.name === 'owner') ? (
            <p className="block bg-form-bg rounded-xl py-1 px-1.5 text-[14px] text-text-light-gray">
                admin
            </p>
        ) : null
    ),
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
