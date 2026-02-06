import { useState } from "react";
import { useAuth } from "../contexts/AuthContext";
import { Navigate } from "react-router-dom";
import { Content } from "../components/content";
import { type ContentProps } from "../components/content";

interface User {
    id: string;
    name: string;
    email: string;
}

interface Applicant {
    id: string;
    name: string;
    email: string;
    date: string;
    message: string;
}

const UsersPermissionsContent: ContentProps<User> = {
    id: 'usuarios',
    label: 'Usuários',
    columns: [
        {
            key: 'name',
            label: 'Nome'
        },
        {
            key: 'email',
            label: 'E-mail'
        }
    ],
    data: [ //API REST
        {
            id: '1',
            name: 'Usuário 1',
            email: 'user1@exemplo.com',
        },
        {
            id: '2',
            name: 'Usuário 2',
            email: 'user2@exemplo.com',
        },
    ],
    rowIdField: 'id',
    renderActions: (item, isExpanded, toggle) => (
        <div className="flex justify-end gap-2">
            <button title='Permissões' className="bg-standard-blue">📄</button>
            <button title='Editar' className="bg-standard-blue">✏️</button>
            <button title='Excluir' className="bg-standard-blue">🗑️</button>
        </div>
    ),
    toolBar: (
        <form className="grid grid-cols-4 gap-4 bg-form-bg p-4 rounded-md">
            <input type='text' placeholder='Nome' className="bg-white border border-border p-2 rounded" />
            <input type='text' placeholder='Email' className="bg-white border border-border p-2 rounded" />
            <select className="bg-white text-text-light-gray border border-border p-2 rounded">
                <option value="">Grupo (opcional)</option>
                {/* FAZER UMA API REST PARA PEGAR OS GRUPOS
                    <option value="admin">Admin</option>
                    <option value="owner">Dono</option>
                    <option value="user">Usuário</option> */}
            </select>
            <button className="bg-standard-blue text-white font-bold cursor-pointer px-4 rounded">Adicionar</button>
        </form>
    )
}
const ApplicantPermissionsContent: ContentProps<Applicant> = {
    id: 'solicitacoes',
    label: 'Solicitações',
    columns: [
        {
            key: 'name',
            label: 'Nome',
        },
        {
            key: 'email',
            label: 'E-mail',
        },
        {
            key: 'date',
            label: 'Data',
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
}

export function Permissions() {
    const [activeTab, setActiveTab] = useState('usuarios');
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