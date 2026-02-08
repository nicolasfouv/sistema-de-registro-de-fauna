import { useState, useEffect } from "react";
import { useAuth } from "../contexts/AuthContext";
import { Navigate } from "react-router-dom";
import { Content } from "../components/content";
import { type ContentProps } from "../components/content";
import { getUsers } from "../services/userService";

export interface User {
    id: string,
    name: string,
    email: string,
    userPic: string,
    role: { name: string },
}

export interface Applicant {
    id: string,
    name: string,
    email: string,
    date: string,
    message: string,
}

export function Permissions() {
    const [activeTab, setActiveTab] = useState('usuarios');
    const [users, setUsers] = useState<User[]>([]);

    useEffect(() => {
        getUsers().then(setUsers).catch(console.error);
    }, []);

    const UsersPermissionsContent: ContentProps<User> = {
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
        data: users,
        rowIdField: 'id',
        renderActions: (item, isExpanded, toggle) => (
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

    const ApplicantPermissionsContent: ContentProps<Applicant> = {
        id: 'solicitacoes',
        label: 'Solicitações',
        columns: [
            {
                key: 'name',
                label: 'Nome',
                width: 'w-1/5'
            },
            {
                key: 'email',
                label: 'E-mail',
                width: 'w-2/5'
            },
            {
                key: 'date',
                label: 'Data',
                width: 'w-1/5'
            }
        ],
        data: [ // API REST
            {
                id: '1',
                name: 'Solicitante 1',
                email: 'solicitante1@exemplo.com',
                date: '2022-01-01',
                message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            },
            {
                id: '2',
                name: 'Solicitante 2',
                email: 'solicitante2@exemplo.com',
                date: '2022-01-02',
                message: 'Não há justificativa da solicitação.'
            }
        ],
        rowIdField: 'id',
        renderActions: (item: Applicant, isExpanded, toggle) => (
            <button
                onClick={() => toggle(item.id)}
                className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
            >
                {isExpanded ? 'Recolher' : 'Expandir'}
            </button>
        ),
        renderExpansion: (item: Applicant, close) => (
            <div className="flex justify-between items-center mb-4">
                <h3 className="font-bold text-text-main uppercase">Informações da Solicitação</h3>
                <div className="flex gap-2 text-xs font-bold uppercasse">
                    <button className="text-green-600 uppercase cursor-pointer">Aceitar</button>
                    <button className="text-red-600 uppercase cursor-pointer">Recusar</button>
                    <button onClick={close} className="text-standard-blue uppercase cursor-pointer">Recolher</button>
                </div>
                {/* Detalhes ao expandir a linha */}
            </div>
        )
    };

    const { user } = useAuth();
    if (user?.role === 'admin' || user?.role === 'owner') {
        return (
            <Content
                title="Permissões"
                activeTabId={activeTab}
                onTabChange={setActiveTab}
                contents={[
                    UsersPermissionsContent,
                    ApplicantPermissionsContent,
                ]}
            />
        )
    }

    return <Navigate to="/minha-conta" replace />



}