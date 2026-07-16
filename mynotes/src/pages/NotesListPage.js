import React, { useState, useEffect, useCallback } from 'react';
import ListItem from '../components/ListItem';
import AddButton from '../components/AddButton';

const NotesListPage = () => {
    const [notes, setNote] = useState([]);

    const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8000';

    const getNotes = useCallback(async () => {
        const response = await fetch(`${API_URL}/api/notes/`);
        const data = await response.json();
        setNote(data);
    }, [API_URL]);

    useEffect(() => {
        getNotes();
    }, [getNotes]);

    return (
        <div className='notes'>
            <div className="notes-header">
                <h2 className="notes-title">
                    &#9782; Notes
                </h2>
                <p className="notes-count">{notes.length}</p>
            </div>

            <div className='notes-list'>
                {notes.map((note, index) => (
                    <div className='note-preview' key={index}>
                        <ListItem note={note} />
                    </div>
                ))}
            </div>

            <AddButton />
        </div>
    );
};

export default NotesListPage;