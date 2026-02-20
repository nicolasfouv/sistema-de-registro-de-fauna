import { useEffect, useState } from "react";
import type { User } from "./users";
import { getGroups } from "../../services/groupsService";
import { getAccessLevelOptions, getForms } from "../../services/formService";
import { getUserAccess, updateUserAccess } from "../../services/userService";

interface FormsPermissionsModalProps {
    user: User,
    close: () => void
}

interface Group {
    id: string,
    name: string,
}

interface Form {
    id: string,
    name: string,
}

interface AccessLevel {
    id: string,
    value: number,
    name: string,
}

export interface UserAccess {
    formId: string,
    accessLevelId: string,
}


export function FormsPermissionsModal({ user, close }: FormsPermissionsModalProps) {
    const [loading, setLoading] = useState(false);
    const [groups, setGroups] = useState<Group[]>([]);
    const [forms, setForms] = useState<{ category: string, forms: Form[] }[]>([]);
    const [accessLevelOptions, setAccessLevelOptions] = useState<AccessLevel[]>([]);
    const [editedUserAccess, setEditedUserAccess] = useState<UserAccess[]>([]);


    useEffect(() => {
        async function fetchGroups() {
            const groups = await getGroups();
            setGroups(groups);
        }
        async function fetchForms() {
            const forms = await getForms();
            setForms(forms);
        }

        async function fetchAccessLevelOptions() {
            const accessLevel = await getAccessLevelOptions();
            const orderedAccessLevelOptions = accessLevel.sort((a: AccessLevel, b: AccessLevel) => a.value - b.value);
            setAccessLevelOptions(orderedAccessLevelOptions);
            console.log(orderedAccessLevelOptions);
        }

        async function fetchUserAccess() {
            const userAccess = await getUserAccess(user.id) as unknown as UserAccess[];
            setEditedUserAccess(userAccess);
        }

        fetchGroups();
        fetchForms();
        fetchAccessLevelOptions();
        fetchUserAccess();
    }, []);



    async function handleSubmitFormsPermissions(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();
        setLoading(true);
        try {
            const newUserAccess = await updateUserAccess(user.id, editedUserAccess);
            console.log(newUserAccess);
        } catch (error: any) {
            console.error(error);
        } finally {
            setLoading(false);
            close();
        }
    }

    function handleAccessLevelChange(formId: string, accessLevel: string) {
        setEditedUserAccess(prevAccess => {
            const newAccess = [...prevAccess];
            const existingIndex = newAccess.findIndex((a) => a.formId === formId);

            if (existingIndex !== -1) {
                if (newAccess[existingIndex].accessLevelId === accessLevel) {
                    newAccess.splice(existingIndex, 1);
                } else {
                    newAccess[existingIndex] = { formId, accessLevelId: accessLevel };
                }
            } else {
                newAccess.push({ formId, accessLevelId: accessLevel })
            }
            return newAccess;
        });
    }

    function handleGroupChange(groupId: string) {

    }

    return (
        <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
            <div className="relative flex flex-col bg-white justify-center items-center rounded-2xl shadow-xl p-10 gap-5 w-320 h-[90%]">
                <button
                    onClick={() => close()}
                    className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                >
                    ✕
                </button>

                <h2 className="text-2xl text-standard-blue font-bold ">
                    Editando Permissões
                </h2>

                <div className="flex gap-5 w-full">
                    <div className="flex flex-col w-2/6">
                        <label htmlFor="name" className="text-sm text-left font-bold mb-1">Usuário:</label>
                        <input
                            type="text"
                            value={user.name}
                            disabled
                            className="border border-border bg-gray-100 rounded-md p-2"
                        />
                    </div>
                    <div className="flex flex-col w-2/6">
                        <label htmlFor="group" className="text-sm text-left font-bold mb-1">Grupo:</label>
                        <select
                            id="group"
                            value={'a'}
                            onChange={(e) => handleGroupChange(e.target.value)}
                            className="border border-border rounded-md p-2"
                        >
                            <option value="">Selecione um grupo (opcional)</option>
                            {groups.map((group) => (
                                <option key={group.id} value={group.id}>{group.name}</option>
                            ))}
                            <option value="custom">Personalizado</option>
                        </select>
                    </div>
                </div>
                <form onSubmit={(e) => handleSubmitFormsPermissions(e)} className="w-full h-[90%] flex flex-col items-center justify-between">

                    <div className="w-full overflow-y-auto">
                        {forms.map((category) => (
                            <table key={category.category} className="w-full text-left border-collapse">
                                <thead className="bg-form-bg border-b border-border">
                                    <tr>
                                        <th className="w-2/3 p-2">{category.category}</th>
                                        <th className="w-1/3 p-2">Nível de Acesso</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {category.forms.map((form) => (
                                        <tr key={category.category + '-' + form.id} className="border-b border-border">
                                            <td className="w-2/3 p-2">
                                                <p>{form.name}</p>
                                            </td>
                                            <td className="w-1/3 p-2">
                                                <div className="flex">
                                                    {accessLevelOptions.map((accessLevel) => (
                                                        <label key={accessLevel.id + '-' + form.id} className="flex items-center gap-2">
                                                            <input
                                                                type="checkbox"
                                                                name={`accessLevel-${form.id}`}
                                                                value={accessLevel.id}
                                                                checked={editedUserAccess.find((access) => access.formId === form.id)?.accessLevelId === accessLevel.id}
                                                                onChange={() => handleAccessLevelChange(form.id, accessLevel.id)}
                                                                disabled={user.role.name === 'admin' || user.role.name === 'owner'}
                                                                className="accent-standard-blue"
                                                            />
                                                            <p className="mr-8">{accessLevel.name}</p>
                                                        </label>
                                                    ))}
                                                </div>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        ))}
                    </div>
                    <div className="flex justify-center items-center gap-5 mt-5">
                        <button
                            type="submit"
                            className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                            disabled={loading}
                        >
                            {loading ? 'Salvando...' : 'Salvar'}
                        </button>
                        <button
                            onClick={() => close()}
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