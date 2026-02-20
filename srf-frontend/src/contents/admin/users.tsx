import { type ContentProps } from "../../components/content";
import { createUser, deleteUser, getUsers } from "../../services/userService";
import deleteButtonDisabledImg from '../../assets/deleteButtonDisabled.svg';
import deleteButtonImg from '../../assets/deleteButton.svg';
import editButtonImg from '../../assets/editButton.svg';
import formsButtonImg from '../../assets/formsButton.svg';
import { useAuth } from "../../contexts/AuthContext";
import { useState } from "react";
import { FormsPermissionsModal } from "./formsPermissionsModal";
import { EditUserModal } from "./editUserModal";

export interface User {
    id: string,
    name: string,
    email: string,
    userPic: string,
    role: { name: string },
}

function UserFirstColumnDetail({ item }: { item: User }) {
    const { user } = useAuth();
    return (
        (item.role?.name === 'admin' || item.role?.name === 'owner') ? (
            (item.id === user?.id) ? (
                <div className="flex gap-1">
                    <p className="block bg-form-bg rounded-xl py-1 px-1.5 text-[14px] text-text-light-gray">(eu)</p>
                    <p className="block bg-form-bg rounded-xl py-1 px-1.5 text-[14px] text-text-light-gray">
                        admin
                    </p>
                </div>
            ) : (
                <p className="block bg-form-bg rounded-xl py-1 px-1.5 text-[14px] text-text-light-gray">
                    admin
                </p>
            )
        ) : null
    )
}


function UserActions({ item, refresh }: { item: User, refresh: () => void }) {
    const { user } = useAuth();
    const [loading, setLoading] = useState(false);

    const [showFormsModal, setShowFormsModal] = useState(false);
    const [showEditModal, setShowEditModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);

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
            <button onClick={() => {
                setShowFormsModal(true);
            }} className="size-8 cursor-pointer">
                <img src={formsButtonImg} alt="Forms button" />
            </button>
            <button onClick={() => {
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

            {/* FORMS PERMISSIONS MODAL */}
            {showFormsModal && user && <FormsPermissionsModal user={item} close={() => setShowFormsModal(false)} />}

            {/* EDIT USER MODAL */}
            {showEditModal && <EditUserModal user={item} close={() => setShowEditModal(false)} refresh={refresh} />}

            {/* DELETE USER MODAL */}
            {
                showDeleteModal && (
                    <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                        <div className="relative flex flex-col bg-white w-160 justify-center items-center rounded-2xl shadow-xl p-10">

                            <button
                                onClick={() => setShowDeleteModal(false)}
                                className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                            >
                                ✕
                            </button>

                            <h2 className="text-2xl text-standard-blue font-bold -mt-6 mb-6">
                                Confirmação de Exclusão
                            </h2>

                            <form onSubmit={(e) => handleSubmitDelete(e, item.id)} className="w-full h-full flex flex-col items-center justify-center">
                                <p className="text-xl text-center">Deseja realmente excluir o usuário <span className="font-bold">{item.name}</span> ?</p>

                                <div className="flex justify-center items-center gap-5 mt-4">
                                    <button
                                        type="submit"
                                        className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                                        disabled={loading}
                                    >
                                        {loading ? 'Confirmando...' : 'Confirmar'}
                                    </button>
                                    <button
                                        onClick={() => setShowDeleteModal(false)}
                                        className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                                    >
                                        Cancelar
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                )
            }
        </div >
    );
}

function UserToolBar({ refresh }: { refresh: () => void }) {
    const { user } = useAuth();
    if (user?.role !== 'owner') {
        return null;
    }
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState<{ name?: string, email?: string, password?: string } | null>(null);
    const [loading, setLoading] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError(null);
        try {
            await createUser(name, email, password);
            refresh();
            setName('');
            setEmail('');
            setPassword('');
        } catch (error: any) {
            setError(error.response?.data?.message as { name?: string, email?: string, password?: string });
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="gap-4 bg-form-bg p-4 rounded-md mx-6 mb-6">
            <h3 className="font-bold text-text-main uppercase text-xs mb-2">Adicionar usuário</h3>
            <form onSubmit={handleSubmit} className="grid grid-cols-4 gap-4">
                <input type='text' placeholder='Nome' className="bg-white border border-border p-2 rounded" value={name} onChange={(e) => setName(e.target.value)} />
                <input type='text' placeholder='Email' className="bg-white border border-border p-2 rounded" value={email} onChange={(e) => setEmail(e.target.value)} />
                <input type='text' placeholder='Senha' className="bg-white border border-border p-2 rounded" value={password} onChange={(e) => setPassword(e.target.value)} />
                <button className="bg-standard-blue text-white font-bold cursor-pointer px-4 rounded" disabled={loading}> {loading ? 'Aguarde...' : 'Adicionar'}</button>
            </form>
            {error && (
                <div className="text-red-500 text-sm mt-2">{error.name || error.email || error.password}</div>
            )}
        </div>
    )
}

export const UsersContentDefinition = {
    id: 'usuarios',
    label: 'Usuários',
    columns: [
        {
            key: 'name',
            label: 'Nome',
            width: 'w-2/5'
        },
        {
            key: 'email',
            label: 'E-mail',
            width: 'w-2/5'
        }
    ],
    firstColumnDetail: (item: User) => (
        <UserFirstColumnDetail item={item} />
    ),
    rowIdField: 'id' as keyof User,
    renderActions: (item: User, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <UserActions item={item} refresh={refresh} />
    ),
    toolBar: (refresh: () => void) => (
        <UserToolBar refresh={refresh} />
    )
};

export const fetchUsersData = async () => {
    return getUsers();
};

export const UsersPermissionsContent: ContentProps<User> = {
    ...UsersContentDefinition,
    data: [],
} as unknown as ContentProps<User>;
